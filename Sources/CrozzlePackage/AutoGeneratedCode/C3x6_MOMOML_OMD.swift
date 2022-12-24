public class C3x6_MOMOML_OMD {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 6
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

            for outery1 in 0..<wordCount {

                if W.Len[outery1] >= interlockHeight + 2 {

                    let outery1Limit = Int(W.Len[outery1]) - Int(interlockHeight)
                    for outery1Pos in 1..<outery1Limit {

                        //print("outery1:\(W.Start[outery1])")

                        for middlex1 in 0..<wordCount {

                            if (W.Len[middlex1] == interlockWidth &&
                                W.Start[middlex1][0] == W.Start[outery1][outery1Pos + 0] &&
                                W.Id[middlex1] != W.Id[outery1]) {
                                //print("middlex1:\(W.Start[middlex1])")

                                for middley2 in 0..<wordCount {

                                    if (W.Len[middley2] == interlockHeight &&
                                        W.Start[middley2][0] == W.Start[middlex1][1] &&
                                        W.Id[middley2] != W.Id[middlex1] &&
                                        W.Id[middley2] != W.Id[outery1]) {
                                        //print("middley2:\(W.Start[middley2])")

                                        for outerx2 in 0..<wordCount {

                                            if W.Len[outerx2] >= interlockWidth + 2 {

                                                let outerx2Limit = Int(W.Len[outerx2]) - Int(interlockWidth)
                                                for outerx2Pos in 1..<outerx2Limit {

                                                    if (W.Start[outerx2][outerx2Pos + 0] == W.Start[outery1][outery1Pos + 1] &&
                                                    W.Start[outerx2][outerx2Pos + 1] == W.Start[middley2][1] &&
                                                    W.Id[outerx2] != W.Id[middley2] &&
                                                    W.Id[outerx2] != W.Id[middlex1] &&
                                                    W.Id[outerx2] != W.Id[outery1]) {
                                                        //print("outerx2:\(W.Start[outerx2])")

                                                        for down3 in 0..<wordCount {

                                                            if (W.Len[down3] >= interlockHeight &&
                                                                W.Start[down3][0] == W.Start[middlex1][2] &&
                                                                W.Start[down3][1] == W.Start[outerx2][outerx2Pos + 2] &&
                                                                W.Id[down3] != W.Id[outerx2] &&
                                                                W.Id[down3] != W.Id[middley2] &&
                                                                W.Id[down3] != W.Id[middlex1] &&
                                                                W.Id[down3] != W.Id[outery1]) {
                                                                //print("down3:\(W.Start[down3])")

                                                                for middlex3 in 0..<wordCount {

                                                                    if (W.Len[middlex3] == interlockWidth &&
                                                                        W.Start[middlex3][0] == W.Start[outery1][outery1Pos + 2] &&
                                                                        W.Start[middlex3][1] == W.Start[middley2][2] &&
                                                                        W.Start[middlex3][2] == W.Start[down3][2] &&
                                                                        W.Id[middlex3] != W.Id[down3] &&
                                                                        W.Id[middlex3] != W.Id[outerx2] &&
                                                                        W.Id[middlex3] != W.Id[middley2] &&
                                                                        W.Id[middlex3] != W.Id[middlex1] &&
                                                                        W.Id[middlex3] != W.Id[outery1]) {
                                                                        //print("middlex3:\(W.Start[middlex3])")

                                                                        for outerx4 in 0..<wordCount {

                                                                            if W.Len[outerx4] >= interlockWidth + 2 {

                                                                                let outerx4Limit = Int(W.Len[outerx4]) - Int(interlockWidth)
                                                                                for outerx4Pos in 1..<outerx4Limit {

                                                                                    if (W.Start[outerx4][outerx4Pos + 0] == W.Start[outery1][outery1Pos + 3] &&
                                                                                    W.Start[outerx4][outerx4Pos + 1] == W.Start[middley2][3] &&
                                                                                    W.Start[outerx4][outerx4Pos + 2] == W.Start[down3][3] &&
                                                                                    W.Id[outerx4] != W.Id[middlex3] &&
                                                                                    W.Id[outerx4] != W.Id[down3] &&
                                                                                    W.Id[outerx4] != W.Id[outerx2] &&
                                                                                    W.Id[outerx4] != W.Id[middley2] &&
                                                                                    W.Id[outerx4] != W.Id[middlex1] &&
                                                                                    W.Id[outerx4] != W.Id[outery1]) {
                                                                                        //print("outerx4:\(W.Start[outerx4])")

                                                                                        for middlex5 in 0..<wordCount {

                                                                                            if (W.Len[middlex5] == interlockWidth &&
                                                                                                W.Start[middlex5][0] == W.Start[outery1][outery1Pos + 4] &&
                                                                                                W.Start[middlex5][1] == W.Start[middley2][4] &&
                                                                                                W.Start[middlex5][2] == W.Start[down3][4] &&
                                                                                                W.Id[middlex5] != W.Id[outerx4] &&
                                                                                                W.Id[middlex5] != W.Id[middlex3] &&
                                                                                                W.Id[middlex5] != W.Id[down3] &&
                                                                                                W.Id[middlex5] != W.Id[outerx2] &&
                                                                                                W.Id[middlex5] != W.Id[middley2] &&
                                                                                                W.Id[middlex5] != W.Id[middlex1] &&
                                                                                                W.Id[middlex5] != W.Id[outery1]) {
                                                                                                //print("middlex5:\(W.Start[middlex5])")

                                                                                                for left6 in 0..<wordCount {

                                                                                                    if (W.Len[left6] >= interlockWidth &&
                                                                                                        W.End[left6][2] == W.Start[outery1][outery1Pos + 5] &&
                                                                                                        W.End[left6][1] == W.Start[middley2][5] &&
                                                                                                        W.End[left6][0] == W.Start[down3][5] &&
                                                                                                        W.Id[left6] != W.Id[middlex5] &&
                                                                                                        W.Id[left6] != W.Id[outerx4] &&
                                                                                                        W.Id[left6] != W.Id[middlex3] &&
                                                                                                        W.Id[left6] != W.Id[down3] &&
                                                                                                        W.Id[left6] != W.Id[outerx2] &&
                                                                                                        W.Id[left6] != W.Id[middley2] &&
                                                                                                        W.Id[left6] != W.Id[middlex1] &&
                                                                                                        W.Id[left6] != W.Id[outery1]) {
                                                                                                        //print("left6:\(W.Start[left6])")

                                                                                                        if phase == 0 {
                                                                                                            shapeCount += 1
                                                                                                        }
                                                                                                        else {
                                                                                                            outerStart[index + 1] = UInt8(outerx2Pos)

                                                                                                            outerStart[index + 3] = UInt8(outerx4Pos)

                                                                                                            outerStart[index + 6] = UInt8(outery1Pos)

                                                                                                            ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [middlex1, outerx2, middlex3, outerx4, middlex5, left6, outery1, middley2, down3])
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
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.middle, .outer, .middle, .outer, .middle, .leading],
            patternVertical: [.outer, .middle, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}