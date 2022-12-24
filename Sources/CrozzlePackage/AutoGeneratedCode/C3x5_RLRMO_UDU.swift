public class C3x5_RLRMO_UDU {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 5
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

            for up1 in 0..<wordCount {

                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.End[up1][4] &&
                            W.Id[right1] != W.Id[up1]) {
                            //print("right1:\(W.Start[right1])")

                            for down2 in 0..<wordCount {

                                if (W.Len[down2] >= interlockHeight &&
                                    W.Start[down2][0] == W.Start[right1][1] &&
                                    W.Id[down2] != W.Id[right1] &&
                                    W.Id[down2] != W.Id[up1]) {
                                    //print("down2:\(W.Start[down2])")

                                    for left2 in 0..<wordCount {

                                        if (W.Len[left2] >= interlockWidth &&
                                            W.End[left2][2] == W.End[up1][3] &&
                                            W.End[left2][1] == W.Start[down2][1] &&
                                            W.Id[left2] != W.Id[down2] &&
                                            W.Id[left2] != W.Id[right1] &&
                                            W.Id[left2] != W.Id[up1]) {
                                            //print("left2:\(W.Start[left2])")

                                            for up3 in 0..<wordCount {

                                                if (W.Len[up3] >= interlockHeight &&
                                                    W.End[up3][4] == W.Start[right1][2] &&
                                                    W.End[up3][3] == W.End[left2][0] &&
                                                    W.Id[up3] != W.Id[left2] &&
                                                    W.Id[up3] != W.Id[down2] &&
                                                    W.Id[up3] != W.Id[right1] &&
                                                    W.Id[up3] != W.Id[up1]) {
                                                    //print("up3:\(W.Start[up3])")

                                                    for right3 in 0..<wordCount {

                                                        if (W.Len[right3] >= interlockWidth &&
                                                            W.Start[right3][0] == W.End[up1][2] &&
                                                            W.Start[right3][1] == W.Start[down2][2] &&
                                                            W.Start[right3][2] == W.End[up3][2] &&
                                                            W.Id[right3] != W.Id[up3] &&
                                                            W.Id[right3] != W.Id[left2] &&
                                                            W.Id[right3] != W.Id[down2] &&
                                                            W.Id[right3] != W.Id[right1] &&
                                                            W.Id[right3] != W.Id[up1]) {
                                                            //print("right3:\(W.Start[right3])")

                                                            for middlex4 in 0..<wordCount {

                                                                if (W.Len[middlex4] == interlockWidth &&
                                                                    W.Start[middlex4][0] == W.End[up1][1] &&
                                                                    W.Start[middlex4][1] == W.Start[down2][3] &&
                                                                    W.Start[middlex4][2] == W.End[up3][1] &&
                                                                    W.Id[middlex4] != W.Id[right3] &&
                                                                    W.Id[middlex4] != W.Id[up3] &&
                                                                    W.Id[middlex4] != W.Id[left2] &&
                                                                    W.Id[middlex4] != W.Id[down2] &&
                                                                    W.Id[middlex4] != W.Id[right1] &&
                                                                    W.Id[middlex4] != W.Id[up1]) {
                                                                    //print("middlex4:\(W.Start[middlex4])")

                                                                    for outerx5 in 0..<wordCount {

                                                                        if W.Len[outerx5] >= interlockWidth + 2 {

                                                                            let outerx5Limit = Int(W.Len[outerx5]) - Int(interlockWidth)
                                                                            for outerx5Pos in 1..<outerx5Limit {

                                                                                if (W.Start[outerx5][outerx5Pos + 0] == W.End[up1][0] &&
                                                                                W.Start[outerx5][outerx5Pos + 1] == W.Start[down2][4] &&
                                                                                W.Start[outerx5][outerx5Pos + 2] == W.End[up3][0] &&
                                                                                W.Id[outerx5] != W.Id[middlex4] &&
                                                                                W.Id[outerx5] != W.Id[right3] &&
                                                                                W.Id[outerx5] != W.Id[up3] &&
                                                                                W.Id[outerx5] != W.Id[left2] &&
                                                                                W.Id[outerx5] != W.Id[down2] &&
                                                                                W.Id[outerx5] != W.Id[right1] &&
                                                                                W.Id[outerx5] != W.Id[up1]) {
                                                                                    //print("outerx5:\(W.Start[outerx5])")

                                                                                    if phase == 0 {
                                                                                        shapeCount += 1
                                                                                    }
                                                                                    else {
                                                                                        outerStart[index + 4] = UInt8(outerx5Pos)

                                                                                        ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, left2, right3, middlex4, outerx5, up1, down2, up3])
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
            patternHorizontal: [.trailing, .leading, .trailing, .middle, .outer],
            patternVertical: [.leading, .trailing, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}