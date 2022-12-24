public class C3x4_MOMO_DUD {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 4
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for down1 in 0..<wordCount {

                if (W.Len[down1] >= interlockHeight) {
                    //print("down1:\(W.Start[down1])")

                    for middlex1 in 0..<wordCount {

                        if (W.Len[middlex1] == interlockWidth &&
                            W.Start[middlex1][0] == W.Start[down1][0] &&
                            W.Id[middlex1] != W.Id[down1]) {
                            //print("middlex1:\(W.Start[middlex1])")

                            for up2 in 0..<wordCount {

                                if (W.Len[up2] >= interlockHeight &&
                                    W.End[up2][3] == W.Start[middlex1][1] &&
                                    W.Id[up2] != W.Id[middlex1] &&
                                    W.Id[up2] != W.Id[down1]) {
                                    //print("up2:\(W.Start[up2])")

                                    for outerx2 in 0..<wordCount {

                                        if W.Len[outerx2] >= interlockWidth + 2 {

                                            let outerx2Limit = Int(W.Len[outerx2]) - Int(interlockWidth)
                                            for outerx2Pos in 1..<outerx2Limit {

                                                if (W.Start[outerx2][outerx2Pos + 0] == W.Start[down1][1] &&
                                                W.Start[outerx2][outerx2Pos + 1] == W.End[up2][2] &&
                                                W.Id[outerx2] != W.Id[up2] &&
                                                W.Id[outerx2] != W.Id[middlex1] &&
                                                W.Id[outerx2] != W.Id[down1]) {
                                                    //print("outerx2:\(W.Start[outerx2])")

                                                    for down3 in 0..<wordCount {

                                                        if (W.Len[down3] >= interlockHeight &&
                                                            W.Start[down3][0] == W.Start[middlex1][2] &&
                                                            W.Start[down3][1] == W.Start[outerx2][outerx2Pos + 2] &&
                                                            W.Id[down3] != W.Id[outerx2] &&
                                                            W.Id[down3] != W.Id[up2] &&
                                                            W.Id[down3] != W.Id[middlex1] &&
                                                            W.Id[down3] != W.Id[down1]) {
                                                            //print("down3:\(W.Start[down3])")

                                                            for middlex3 in 0..<wordCount {

                                                                if (W.Len[middlex3] == interlockWidth &&
                                                                    W.Start[middlex3][0] == W.Start[down1][2] &&
                                                                    W.Start[middlex3][1] == W.End[up2][1] &&
                                                                    W.Start[middlex3][2] == W.Start[down3][2] &&
                                                                    W.Id[middlex3] != W.Id[down3] &&
                                                                    W.Id[middlex3] != W.Id[outerx2] &&
                                                                    W.Id[middlex3] != W.Id[up2] &&
                                                                    W.Id[middlex3] != W.Id[middlex1] &&
                                                                    W.Id[middlex3] != W.Id[down1]) {
                                                                    //print("middlex3:\(W.Start[middlex3])")

                                                                    for outerx4 in 0..<wordCount {

                                                                        if W.Len[outerx4] >= interlockWidth + 2 {

                                                                            let outerx4Limit = Int(W.Len[outerx4]) - Int(interlockWidth)
                                                                            for outerx4Pos in 1..<outerx4Limit {

                                                                                if (W.Start[outerx4][outerx4Pos + 0] == W.Start[down1][3] &&
                                                                                W.Start[outerx4][outerx4Pos + 1] == W.End[up2][0] &&
                                                                                W.Start[outerx4][outerx4Pos + 2] == W.Start[down3][3] &&
                                                                                W.Id[outerx4] != W.Id[middlex3] &&
                                                                                W.Id[outerx4] != W.Id[down3] &&
                                                                                W.Id[outerx4] != W.Id[outerx2] &&
                                                                                W.Id[outerx4] != W.Id[up2] &&
                                                                                W.Id[outerx4] != W.Id[middlex1] &&
                                                                                W.Id[outerx4] != W.Id[down1]) {
                                                                                    //print("outerx4:\(W.Start[outerx4])")

                                                                                    if phase == 0 {
                                                                                        shapeCount += 1
                                                                                    }
                                                                                    else {
                                                                                        outerStart[index + 1] = UInt8(outerx2Pos)

                                                                                        outerStart[index + 3] = UInt8(outerx4Pos)

                                                                                        ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [middlex1, outerx2, middlex3, outerx4, down1, up2, down3])
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.middle, .outer, .middle, .outer],
            patternVertical: [.trailing, .leading, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}