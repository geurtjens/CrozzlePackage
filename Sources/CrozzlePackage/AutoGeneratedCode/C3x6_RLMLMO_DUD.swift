public class C3x6_RLMLMO_DUD {
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

            for down1 in 0..<wordCount {

                if (W.Len[down1] >= interlockHeight) {
                    //print("down1:\(W.Start[down1])")

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.Start[down1][0] &&
                            W.Id[right1] != W.Id[down1]) {
                            //print("right1:\(W.Start[right1])")

                            for up2 in 0..<wordCount {

                                if (W.Len[up2] >= interlockHeight &&
                                    W.End[up2][5] == W.Start[right1][1] &&
                                    W.Id[up2] != W.Id[right1] &&
                                    W.Id[up2] != W.Id[down1]) {
                                    //print("up2:\(W.Start[up2])")

                                    for left2 in 0..<wordCount {

                                        if (W.Len[left2] >= interlockWidth &&
                                            W.End[left2][2] == W.Start[down1][1] &&
                                            W.End[left2][1] == W.End[up2][4] &&
                                            W.Id[left2] != W.Id[up2] &&
                                            W.Id[left2] != W.Id[right1] &&
                                            W.Id[left2] != W.Id[down1]) {
                                            //print("left2:\(W.Start[left2])")

                                            for down3 in 0..<wordCount {

                                                if (W.Len[down3] >= interlockHeight &&
                                                    W.Start[down3][0] == W.Start[right1][2] &&
                                                    W.Start[down3][1] == W.End[left2][0] &&
                                                    W.Id[down3] != W.Id[left2] &&
                                                    W.Id[down3] != W.Id[up2] &&
                                                    W.Id[down3] != W.Id[right1] &&
                                                    W.Id[down3] != W.Id[down1]) {
                                                    //print("down3:\(W.Start[down3])")

                                                    for middlex3 in 0..<wordCount {

                                                        if (W.Len[middlex3] == interlockWidth &&
                                                            W.Start[middlex3][0] == W.Start[down1][2] &&
                                                            W.Start[middlex3][1] == W.End[up2][3] &&
                                                            W.Start[middlex3][2] == W.Start[down3][2] &&
                                                            W.Id[middlex3] != W.Id[down3] &&
                                                            W.Id[middlex3] != W.Id[left2] &&
                                                            W.Id[middlex3] != W.Id[up2] &&
                                                            W.Id[middlex3] != W.Id[right1] &&
                                                            W.Id[middlex3] != W.Id[down1]) {
                                                            //print("middlex3:\(W.Start[middlex3])")

                                                            for left4 in 0..<wordCount {

                                                                if (W.Len[left4] >= interlockWidth &&
                                                                    W.End[left4][2] == W.Start[down1][3] &&
                                                                    W.End[left4][1] == W.End[up2][2] &&
                                                                    W.End[left4][0] == W.Start[down3][3] &&
                                                                    W.Id[left4] != W.Id[middlex3] &&
                                                                    W.Id[left4] != W.Id[down3] &&
                                                                    W.Id[left4] != W.Id[left2] &&
                                                                    W.Id[left4] != W.Id[up2] &&
                                                                    W.Id[left4] != W.Id[right1] &&
                                                                    W.Id[left4] != W.Id[down1]) {
                                                                    //print("left4:\(W.Start[left4])")

                                                                    for middlex5 in 0..<wordCount {

                                                                        if (W.Len[middlex5] == interlockWidth &&
                                                                            W.Start[middlex5][0] == W.Start[down1][4] &&
                                                                            W.Start[middlex5][1] == W.End[up2][1] &&
                                                                            W.Start[middlex5][2] == W.Start[down3][4] &&
                                                                            W.Id[middlex5] != W.Id[left4] &&
                                                                            W.Id[middlex5] != W.Id[middlex3] &&
                                                                            W.Id[middlex5] != W.Id[down3] &&
                                                                            W.Id[middlex5] != W.Id[left2] &&
                                                                            W.Id[middlex5] != W.Id[up2] &&
                                                                            W.Id[middlex5] != W.Id[right1] &&
                                                                            W.Id[middlex5] != W.Id[down1]) {
                                                                            //print("middlex5:\(W.Start[middlex5])")

                                                                            for outerx6 in 0..<wordCount {

                                                                                if W.Len[outerx6] >= interlockWidth + 2 {

                                                                                    let outerx6Limit = Int(W.Len[outerx6]) - Int(interlockWidth)
                                                                                    for outerx6Pos in 1..<outerx6Limit {

                                                                                        if (W.Start[outerx6][outerx6Pos + 0] == W.Start[down1][5] &&
                                                                                        W.Start[outerx6][outerx6Pos + 1] == W.End[up2][0] &&
                                                                                        W.Start[outerx6][outerx6Pos + 2] == W.Start[down3][5] &&
                                                                                        W.Id[outerx6] != W.Id[middlex5] &&
                                                                                        W.Id[outerx6] != W.Id[left4] &&
                                                                                        W.Id[outerx6] != W.Id[middlex3] &&
                                                                                        W.Id[outerx6] != W.Id[down3] &&
                                                                                        W.Id[outerx6] != W.Id[left2] &&
                                                                                        W.Id[outerx6] != W.Id[up2] &&
                                                                                        W.Id[outerx6] != W.Id[right1] &&
                                                                                        W.Id[outerx6] != W.Id[down1]) {
                                                                                            //print("outerx6:\(W.Start[outerx6])")

                                                                                            if phase == 0 {
                                                                                                shapeCount += 1
                                                                                            }
                                                                                            else {
                                                                                                outerStart[index + 5] = UInt8(outerx6Pos)

                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, left2, middlex3, left4, middlex5, outerx6, down1, up2, down3])
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
            patternHorizontal: [.trailing, .leading, .middle, .leading, .middle, .outer],
            patternVertical: [.trailing, .leading, .trailing],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}